#!groovy

library "github.com/melt-umn/jenkins-lib"

melt.setProperties silverBase: true, ablecBase: true

def extension_name = "ableC-skeleton"
def newenv

node {
  try {

    stage ("Build") {

      newenv = ablec.prepareWorkspace(extension_name)
      
      withEnv(newenv) {
        dir("extensions/${extension_name}") {
          sh "make clean build"
        }
      }
    }
    
    stage ("Examples") {
      withEnv(newenv) {
        dir("extensions/${extension_name}") {
          sh "make examples"
        }
      }
    }

    stage ("Modular Analyses") {
      withEnv(newenv) {
        dir("extensions/${extension_name}") {
          /* use -B option to always run analyses */
          sh "make -B analyses"
        }
      }
    }

    stage ("Test") {
      withEnv(newenv) {
        dir("extensions/${extension_name}") {
          /* use -B option to always run tests */
          sh "make -B test"
        }
      }
    }

    /* If we've gotten all this way with a successful build, don't take up disk space */
    sh "rm -rf generated/* || true"
  }
  catch (e) {
    melt.handle(e)
  }
  finally {
    melt.notify(extension_name)
  }
}

