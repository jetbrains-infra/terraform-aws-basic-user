data "aws_iam_policy_document" "user_policy" {

  statement {
    actions = ["sts:AssumeRole"]
    resources = ["${local.roles}"]
  }

  statement {
    actions = [
      "iam:CreateAccessKey",
      "iam:DeleteAccessKey",
      "iam:GetUser"
    ]
    resources = ["${aws_iam_user.user.arn}"]
  }

}

resource "aws_iam_user_policy" "assume" {
  name   = "AllowAssumeRolesAndManageOwnKeys"
  policy = "${data.aws_iam_policy_document.user_policy.json}"
  user   = "${aws_iam_user.user.name}"
}

resource "aws_iam_user" "user" {
  name = "${local.name}"
}