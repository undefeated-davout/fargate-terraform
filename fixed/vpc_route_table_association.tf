resource "aws_route_table_association" "sample-dev-rt-internet-as-1a" {
  route_table_id = aws_route_table.sample-dev-rt-internet.id
  subnet_id      = aws_subnet.sample-dev-sb-pb-ingress-1a.id
}

resource "aws_route_table_association" "sample-dev-rt-internet-as-1c" {
  route_table_id = aws_route_table.sample-dev-rt-internet.id
  subnet_id      = aws_subnet.sample-dev-sb-pb-ingress-1c.id
}

resource "aws_route_table_association" "sample-dev-rt-manage-as-1a" {
  route_table_id = aws_route_table.sample-dev-rt-internet.id
  subnet_id      = aws_subnet.sample-dev-sb-pb-manage-1a.id
}


resource "aws_route_table_association" "sample-dev-rt-manage-as-1c" {
  route_table_id = aws_route_table.sample-dev-rt-internet.id
  subnet_id      = aws_subnet.sample-dev-sb-pb-manage-1c.id
}

resource "aws_route_table_association" "sample-dev-rt-app-as-1a" {
  route_table_id = aws_route_table.sample-dev-rt-app.id
  subnet_id      = aws_subnet.sample-dev-sb-pr-container-1a.id
}

resource "aws_route_table_association" "sample-dev-rt-app-as-1c" {
  route_table_id = aws_route_table.sample-dev-rt-app.id
  subnet_id      = aws_subnet.sample-dev-sb-pr-container-1c.id
}
