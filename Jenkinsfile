/***********************************************************************
 * Constants
 ***********************************************************************/
def image    = "baselibrary/nodejs"
def registry = "thoughtworks.io"

/***********************************************************************
 * Build code
 ***********************************************************************/

node('docker') {
  stage 'Build'
    dockerImage = docker.build("${image}:4", "4")
    docker.withRegistry("https://${registry}", 'registry-login') {
      dockerImage.push()
    }
    dockerImage = docker.build("${image}:5", "5")
    docker.withRegistry("https://${registry}", 'registry-login') {
      dockerImage.push()
    }
    dockerImage = docker.build("${image}:6", "6")
    docker.withRegistry("https://${registry}", 'registry-login') {
      dockerImage.push()
      dockerImage.push("latest")
    }
}


