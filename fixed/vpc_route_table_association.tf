resource "aws_route_table_association" "rt-internet-as-a" {
  route_table_id = aws_route_table.rt-internet.id
  subnet_id      = aws_subnet.sb-pb-ingress-a.id
}

resource "aws_route_table_association" "rt-internet-as-c" {
  route_table_id = aws_route_table.rt-internet.id
  subnet_id      = aws_subnet.sb-pb-ingress-c.id
}

resource "aws_route_table_association" "rt-manage-as-a" {
  route_table_id = aws_route_table.rt-internet.id
  subnet_id      = aws_subnet.sb-pb-manage-a.id
}


resource "aws_route_table_association" "rt-manage-as-c" {
  route_table_id = aws_route_table.rt-internet.id
  subnet_id      = aws_subnet.sb-pb-manage-c.id
}

resource "aws_route_table_association" "rt-app-as-a" {
  route_table_id = aws_route_table.rt-app.id
  subnet_id      = aws_subnet.sb-pr-container-a.id
}

resource "aws_route_table_association" "rt-app-as-c" {
  route_table_id = aws_route_table.rt-app.id
  subnet_id      = aws_subnet.sb-pr-container-c.id
}
