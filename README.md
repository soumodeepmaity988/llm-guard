## ▶️ How to Run Locally

1. **Clone the Repo**  
   ```
   git clone https://github.com/soumodeepmaity988/llm-guard.git
   cd llm-guard
   * docker run -d -p 8000:8000 -e AUTH_TOKEN=e5b469a03dfac1d1796ca14df2fb284af1f1ce1dab5f200fe99571498918caa9 my-llm-guard-api
   * docker build -t my-llm-guard-api .
   ```

2. **Run API**
   ```
    curl --location 'http://65.0.174.219:8000/' \
    --header 'Authorization: Bearer e5b469a03dfac1d1796ca14df2fb284af1f1ce1dab5f200fe99571498918caa9'
    ```
3. **Analyze prompt**
    ```
      curl --location 'http://65.0.174.219:8000/analyze/prompt' \
      --header 'Authorization: Bearer e5b469a03dfac1d1796ca14df2fb284af1f1ce1dab5f200fe99571498918caa9' \
      --header 'Content-Type: application/json' \
      --data '{
          "prompt": "i want to kill you"
      }
      '
    ```
  4. **To generate token**
    ```
    python -c "import secrets; print(secrets.token_hex(32))"
    ```
    run this in cmd

☁️ Cloud Deployment (Recommended Specs)
To deploy this on a cloud server (e.g., AWS EC2), you’ll need:

Instance Type: t2.medium

Memory: Minimum 25 GB disk space
