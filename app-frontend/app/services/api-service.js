// app/services/api-service.js
import Service from '@ember/service';
import fetch from 'fetch';

export default class ApiService extends Service {
  async get(url) {
    const response = await fetch(url);
    return response.json();
  }

  async post(url, body) {
    const response = await fetch(url, {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify(body)
    });

    return response.json();
  }
}