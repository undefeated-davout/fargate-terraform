resource "aws_route_table_association" "rt-internet-as-1a" {
  route_table_id = aws_route_table.rt-internet.id
  subnet_id      = aws_subnet.sb-pb-ingress-1a.id
}

resource "aws_route_table_association" "rt-internet-as-1c" {
  route_table_id = aws_route_table.rt-internet.id
  subnet_id      = aws_subnet.sb-pb-ingress-1c.id
}

resource "aws_route_table_association" "rt-manage-as-1a" {
  route_table_id = aws_route_table.rt-internet.id
  subnet_id      = aws_subnet.sb-pb-manage-1a.id
}


resource "aws_route_table_association" "rt-manage-as-1c" {
  route_table_id = aws_route_table.rt-internet.id
  subnet_id      = aws_subnet.sb-pb-manage-1c.id
}

resource "aws_route_table_association" "rt-app-as-1a" {
  route_table_id = aws_route_table.rt-app.id
  subnet_id      = aws_subnet.sb-pr-container-1a.id
}

resource "aws_route_table_association" "rt-app-as-1c" {
  route_table_id = aws_route_table.rt-app.id
  subnet_id      = aws_subnet.sb-pr-container-1c.id
}
