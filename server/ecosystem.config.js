module.exports = {
    apps: [
      {
        name: 'server_app',
        script: 'app.py',
        interpreter: 'python3',
        env: {
          NODE_ENV: 'development', // Default environment
        },
        env_production: {
          NODE_ENV: 'production', // Production environment

        },
        env_staging: {
          NODE_ENV: 'staging', // Staging environment

        },
      },
    ],
  };
  