# -----------------------------------------------------------------------------
# Outputs: TF-MOD-AWS-SQS
# -----------------------------------------------------------------------------

output "queue_id" {
  description = "The URL for the created Amazon SQS queue"
  value = element(
    concat(
      aws_sqs_queue.default.*.id,
      [""],
    ),
    0,
  )
}

output "queue_arn" {
  description = "The ARN of the SQS queue"
  value = element(
    concat(
      aws_sqs_queue.default.*.arn,
      [""],
    ),
    0,
  )
}


output "sqs_map" {
  value       = zipmap(aws_sqs_queue.default.*.id, aws_sqs_queue.default.*.arn)
  description = "A map of streams sqs ids and their ARNs"
}
