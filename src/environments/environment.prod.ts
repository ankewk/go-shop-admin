export const environment = {
  production: true,
  environment: 'prod',
  apiUrl: 'https://api.go-shop.com/api/v1',
  apiBaseUrl: 'https://api.go-shop.com',
  dbConfig: {
    host: 'prod-mysql.go-shop.com',
    port: 3308,
    database: 'go_shop'
  },
  features: {
    enableDebugMode: false,
    enableMockData: false,
    enableLogging: false
  }
}; 