sum=0
num=0
File.open("/tmp/data.txt") do |file|
  file.each do |line| 
    num=num+1 
    sum=sum+"#{line}".to_i
  end
end
puts "average is ",sum/num
aver=sum/num;
sum=0
File.open("/tmp/data.txt") do |file|
  file.each do |line|
    sum=sum+(("#{line}".to_i-aver)**2)
  end
end
puts "varience is ",sum/num
