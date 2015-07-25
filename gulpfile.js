var gulp=require('gulp');
var less = require('gulp-less');
var path = require('path');
var minifyCSS = require('gulp-minify-css');

gulp.task('less',function () {
	gulp.watch(['./less/**/*.less','./less/*.less'], ['less-compile']);
});



gulp.task('less-compile', function () {
  return gulp.src(['./less/**/*.less','./less/*.less'])
    .pipe(less())
    .pipe(minifyCSS())
    .pipe(gulp.dest('./public/css'));
});

