# get_gender function
get_gender <- function(name) { 
  if (is.na(comic_names$gsm[comic_names$name_1 == name])){
    print(comic_names$sex_1[comic_names$name_1 == name])
  } else {
    print(comic_names$gsm[comic_names$name_1 == name])
  }
}  