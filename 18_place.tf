resource "aws_placement_group" "suuu_place" {
  name     = "suuu-place"
  strategy = "cluster"
}

# 배치전략? 오토스케일링 할 때 
# cluster,partition,sptread가 있다!