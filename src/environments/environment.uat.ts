export const environment = {
  production: false,
  environment: 'uat',
  apiUrl: 'http://uat-api.go-shop.com/api/v1',
  apiBaseUrl: 'http://uat-api.go-shop.com',
  dbConfig: {
    host: 'uat-mysql.go-shop.com',
    port: 3308,
    database: 'go_shop_uat'
  },
  features: {
    enableDebugMode: true,
    enableMockData: false,
    enableLogging: true
  }
}; 