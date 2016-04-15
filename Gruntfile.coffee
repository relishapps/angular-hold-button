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
        uglify: {
            js: {
                files: {
                    'dist/angular-hold-button.min.js': ['src/angular-hold-button.js'],
                }
            }
        },
        clean: {
            js: ['src/angular-hold-button.js'],
        },
        watch: {
            coffee: {
                files: ['src/angular-hold-button.coffee'],
                tasks: ['coffee:compile', 'uglify:js', 'clean:js'],
                options: {
                    livereload: true,
                },
            },
        },
    }

    grunt.loadNpmTasks 'grunt-contrib-uglify'
    grunt.loadNpmTasks 'grunt-contrib-coffee'
    grunt.loadNpmTasks 'grunt-contrib-clean'
    grunt.loadNpmTasks 'grunt-contrib-watch'
