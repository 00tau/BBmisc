.BBmisc.parallel.export.env = new.env()

.onLoad = function(libname, pkgname) {
  options(BBmisc.ProgressBar.style = "text")
  options(BBmisc.ProgressBar.width = getOption("width"))
  options(BBmisc.parallel.mode = "local")
  options(BBmisc.parallel.cpus = 1L)
  options(BBmisc.parallel.level = as.character(NA))
  options(BBmisc.parallel.log = NULL) 
}
