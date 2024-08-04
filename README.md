## Verify Redis Functionality

To ensure Redis is functioning correctly with your WordPress setup, follow these steps:

### 1. Check the Redis Object Cache Plugin Status in WordPress

1. **Access the WordPress Admin Dashboard**:
   - Log in to your WordPress admin panel (`http://<your_domain>/wp-admin`).

2. **Navigate to the Plugins Section**:
   - Go to **"Plugins"** and find the **"Redis Object Cache"** plugin.

3. **Review the Plugin Status**:
   - Click on **"Settings"** below the Redis Object Cache plugin.
   - Verify the Redis connection status:
     - **Status**: Should indicate "Enabled".
     - **Filesystem**: Should be "Writeable".
     - **Redis**: Should indicate "Reachable" and should not show connection errors.

### 2. Check Redis from Within the Redis Container

1. **Access the Redis Container**:
   - Run the following command to enter the Redis container:
     ```bash
     docker exec -it redis sh
     ```

2. **Use `redis-cli` to Check Redis**:
   - Once inside the container, execute the following command to access the Redis command-line interface:
     ```bash
     redis-cli
     ```

3. **Check Redis Keys**:
   - Run the following command to list all keys in Redis:
     ```bash
     keys '*'
     ```
   - This will show all the keys stored in Redis. If you see relevant keys for your WordPress application, it means Redis is functioning and being used for caching.

4. **Exit Redis CLI and the Container**:
   - Exit the Redis CLI with the command:
     ```bash
     exit
     ```
   - Then, exit the Redis container with the command:
     ```bash
     exit
     ```

### Additional Notes

- **If Redis is not functioning as expected**, check the Redis configuration in the `redis.conf` file and ensure it is correctly set up to accept connections from WordPress.
- **Review the logs of the Redis container** if you encounter issues while running the commands. You can do this with the following command:
  ```bash
  docker logs redis
  ```