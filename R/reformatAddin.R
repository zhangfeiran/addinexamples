# reformat a block of code using formatR.
reformatAddin = function() {
  
  # get the document context.
  context = rstudioapi::getActiveDocumentContext()
  brace.newline = FALSE
  indent = 2
  width = 90
  
  # use formatR to reformat
  formatted = formatR::tidy_source(text = context$contents, output = FALSE, width.cutoff = width, 
    indent = indent, brace.newline = brace.newline)$text.tidy
  
  # set with formatted doc
  output = paste(formatted, collapse = "\n")
  rstudioapi::setDocumentContents(output, id = context$id)
}
