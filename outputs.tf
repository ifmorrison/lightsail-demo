output "public_ip_address" {                                                   
  value = "${aws_lightsail_instance.aws_lightsail_instance.public_ip_address}"
}                                                                              
                                                                               
output "private_key" {                                                         
  value = "${aws_lightsail_key_pair.lightsail_key_pair.private_key}"           
}                                                                              
                                                                               
output "public_key" {                                                          
  value = "${aws_lightsail_key_pair.lightsail_key_pair.public_key}"            
}                                                                              
