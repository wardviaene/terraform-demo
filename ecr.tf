# uncomment for ecr
#resource "aws_ecr_repository" "php7" {
#    name = "php7"
#}
#resource "aws_ecr_repository_policy" "php7-policy" {
#  repository = "${aws_ecr_repository.php7.name}"
#  policy = <<EOF
#{
#    "Version": "2008-10-17",
#    "Statement": [
#        {
#            "Sid": "new policy",
#            "Effect": "Allow",
#            "Principal": {
#                  "AWS": [
#                      "arn:aws:iam::${AWS_ACCOUNT_ID}:role/${aws_iam_role.app-ec2-role.name}",
#                      "arn:aws:iam::${AWS_ACCOUNT_ID}:role/elasticbeanstalk-service-role"
#                    ],
#            "Action": [
#                "ecr:GetDownloadUrlForLayer",
#                "ecr:BatchGetImage",
#                "ecr:BatchCheckLayerAvailability"
#            ]
#        }
#    ]
#}
#EOF
#}
