gulp				= require "gulp"
sass				= require "gulp-sass"
coffee			= require "gulp-coffee"
gutil				= require "gulp-util"
plumber			= require "gulp-plumber"
watch				= require "gulp-watch"
browserSync = require "browser-sync"
reload			= browserSync.reload

gulp.task "browser-sync", () ->
	browserSync {
		injectChanges: true
		# tunnel: true
		server:
			baseDir: './'
	}

gulp.task "html", () ->
	gulp.src(["*.html"])
		.pipe reload({stream: true})

gulp.task "sass", () ->
	gulp.src(["assets/**/style.css.scss"])
		.pipe(plumber())
		.pipe(sass({errLogToConsole: true}))
		.pipe(gulp.dest("./assets/css"))
		.pipe reload({stream: true})

gulp.task "coffee", () ->
	gulp.src(["**/assets/js/*.coffee"])
		.pipe(plumber())
		.pipe(coffee({bare: true}))
		.pipe(gulp.dest(""))

gulp.task "watch", () ->
	gulp.watch "shared/**/*.scss", ["sass"]
	gulp.watch "**/*.coffee", ["coffee", reload]
	gulp.watch "**/*.html", ["html"]

gulp.task "default", [
	"sass"
	"coffee"
], () ->
	gulp.start "browser-sync", "watch"
	return

