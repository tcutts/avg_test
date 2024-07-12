x <- scan(file="/tmp/data.txt",
          what=integer(),
          comment.char = "",
          n= 100000000)
save(x, file="/tmp/data.Rdata");
