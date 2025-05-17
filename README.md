# Monitoring Setup

## Update Host Whoami Information

To update the host's user information, run the following command on the host terminal:

```bash
#!/bin/bash
echo "whoami_info{user=\"$(whoami)\"} 1" > textfile_collector/whoami.prom
```

Alternatively, you can use the provided batch job script to update this periodically:
```bash
bash whoami_batch.sh
```