# Stress Test Design

## Purpose
Validate CloudWatch alarms and monitoring setup.

## EC2 Stress Test
- Use stress or stress-ng
- Increase CPU load above 80%
- Verify SNS email alert is triggered

## EKS Stress Test
- Deploy CPU-intensive pod
- Observe node metrics in CloudWatch
- Confirm alarm activation

## Expected Result
- Alarm state transitions to ALARM
- SNS notification received via email
