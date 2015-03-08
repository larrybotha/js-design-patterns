gulp				= require "gulp"
sass				= require "gulp-sass"
coffee			= require "gulp-coffee"
gutil				= require "gulp-util"
plumber			= require "gulp-plumber"
watch				= require "gulp-watch"
browserSync = require "browser-sync"
reload			= browserSync.reload
spawn				= require('child_process').spawn

gulp.task 'auto-reload', () ->
  process = undefined

  restart = () ->
    if process
      process.kill()
    process = spawn('gulp', [ 'default' ], stdio: 'inherit')
    return

  gulp.watch ['gulpfile.coffee', 'config.js'], restart
  restart()
  return

gulp.task "browser-sync", () ->
	browserSync {
		injectChanges: true
		# tunnel: true
		open: false
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
	gulp.src(["**/assets/coffee/*.coffee"], { cwdbase: true })
		.pipe(plumber())
		.pipe(coffee({bare: true}))
		.pipe(gulp.dest("../js"))

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

