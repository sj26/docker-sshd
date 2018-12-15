# Docker sshd container

Yes, sshd in docker is usually bad. But sometimes it's super handy while debugging weird Fargate issues.

```json
[
  {
    "name": "service",
    ...
  }
  {
    "name": "sshd",
    "image": "sj26/sshd",
    "essential": true,
    "environment": [
      {"name": "AUTHORIZED_KEYS", "value": "ssh-rsa ..."}
    ],
    "portMappings": [
      {"containerPort": 22}
    ],
    "volumesFrom": [{"sourceContainer": "service"}]
  }
```
