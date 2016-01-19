
module.exports = (grunt) ->
    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),
        coffee: {
            # compileDefault: {
            #     files: {
            #       'build/app/*.js': ['src/app/*.coffee'],
            #     }
            # }
            # build: {
            #     options: {
            #         bare: true
            #     },
            #     files: {
            #         'build/app/*.js': 'src/app/*.coffee',
            #         'build/index.js': 'src/index.coffee'
            #     }
            # }
            build: {
                expand: true,
                cwd: 'src',
                src: [ '**/*.coffee' ],
                dest: 'build',
                ext: '.js'
            }
        }
        jade: {
            # compileDefault: {
            #     files: {
            #        'build/view/*.html': ['src/view/*.jade'],
            #     }
            # }
            # compile: {
            #     options: {
            #         pretty:true
            #         data: {
            #             debug: false
            #             timestamp: "<%= new Date().getTime() %>"
            #         }
            #     }
            #     files: {
            #       'build/view/*.html': ['src/view/*.jade'],
            #     }
            # }
            # dist: {
            #     options: {
            #         pretty:true
            #     },
            #     files: {
            #         'build/view/*.html': 'src/view/*.jade',
            #         'build/index.html': 'src/index.jade'
            #     }
            # }
            build: {
                expand: true,
                cwd: 'src',
                src: [ '**/*.jade' ],
                dest: 'build',
                ext: '.html'
            }
        }
        exec: {
            # making a directory newbuild and copying build html and js to that folder.
            mkdir: {
                cmd: ()-> "mkdir -p ./build/newbuild/view && mkdir -p ./build/newbuild/app"
                            
            }
            copyHtml: {
                cmd: ()-> "cp ./build/view/*.html ./build/newbuild/view/"
            }
            copyJs: {
                cmd: ()-> "cp ./build/app/*.js ./build/newbuild/app/"
            }
        }
        watch: {
            coffee: {
                files: ['src/**/*.coffee'],
                tasks: ['coffee']
            }
            jade: {
                files: ['src/**/*.jade'],
                tasks: ['jade']
            }
        }
    });
    
    grunt.loadNpmTasks('grunt-contrib-coffee');
    grunt.loadNpmTasks('grunt-contrib-jade');
    grunt.loadNpmTasks('grunt-contrib-watch');
    grunt.loadNpmTasks('grunt-exec');

    grunt.registerTask('default', [
        'coffee'
        'jade'
        'exec'
    ]); 
