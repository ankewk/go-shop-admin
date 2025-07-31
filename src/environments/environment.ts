export const environment = {
  production: false,
  environment: 'dev',
  apiUrl: 'http://localhost:8080/api/v1',
  apiBaseUrl: 'http://localhost:8080',
  dbConfig: {
    host: 'localhost',
    port: 3308,
    database: 'go_shop_dev'
  },
  features: {
    enableDebugMode: true,
    enableMockData: false,
    enableLogging: true
  }
}; 