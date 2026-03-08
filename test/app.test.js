const request = require('supertest');
const app = require('../app');

describe('Simple Application', function () {
  it('GET / should return 200', function (done) {
    request(app)
      .get('/')
      .expect(200, done);
  });

  it('GET /about should return 200', function (done) {
    request(app)
      .get('/about')
      .expect(200, done);
  });

  it('GET /contact should return 200', function (done) {
    request(app)
      .get('/contact')
      .expect(200, done);
  });

  it('GET /health should return OK', function (done) {
    request(app)
      .get('/health')
      .expect(200)
      .expect('OK', done);
  });
});