module.exports = (grunt) ->

    grunt.registerTask 'watch', ['watch']

    grunt.initConfig {
        coffee: {
            compile: {
                files: {
                    'src/angular-hold-button.js': 'src/angular-hold-button.coffee',
                }
            }
        },
        less: {
            compile: {
                files: {
                    'src/angular-hold-button.css': 'src/angular-hold-button.less',
                }
            }
        }
        uglify: {
            js: {
                files: {
                    'dist/angular-hold-button.min.js': ['src/angular-hold-button.js'],
                }
            },
        },
        cssmin: {
            target: {
                files: {
                    'dist/angular-hold-button.min.css': ['src/angular-hold-button.css'],
                }
            }
        },
        clean: {
            js: ['src/angular-hold-button.js'],
            css: ['src/angular-hold-button.css'],
        },
        watch: {
            coffee: {
                files: ['src/angular-hold-button.coffee'],
                tasks: ['coffee:compile', 'uglify:js', 'clean:js'],
                options: {
                    livereload: true,
                },
            },
            less: {
                files: ['src/angular-hold-button.less'],
                tasks: ['less:compile', 'cssmin:target', 'clean:css'],
            },
        },
    }

    grunt.loadNpmTasks 'grunt-contrib-uglify'
    grunt.loadNpmTasks 'grunt-contrib-coffee'
    grunt.loadNpmTasks 'grunt-contrib-less'
    grunt.loadNpmTasks 'grunt-contrib-cssmin'
    grunt.loadNpmTasks 'grunt-contrib-clean'
    grunt.loadNpmTasks 'grunt-contrib-watch'
