x <- scan(file="/tmp/data.txt",
          what=integer(),
          comment.char = "",
          n= 1000000000)
mean(x)
var(x)

