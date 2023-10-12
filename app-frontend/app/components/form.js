// app/components/form.js
import { inject as service } from '@ember/service';
import Component from '@ember/component';
import { action } from '@ember/object';

export default class TransactionFormComponent extends Component {
    @service apiService;
  @action
  async handleSubmit(event) {
    event.preventDefault();

    // Get the account ID and amount from the form fields
    const accountId = this.element.querySelector('#account-id').value;
    const amount = this.element.querySelector('#amount').value;

    // Create a body object with the account ID and amount
    const body = {
      account_id: accountId,
      amount: amount,
    };

    try {
      // Make a POST request to the API to create a new transaction
      await this.apiService.post('http://127.0.0.1:3000/api/v1/transactions/', body);

      // Clear the form
      this.element.querySelector('#account-id').value = '';
      this.element.querySelector('#amount').value = '';
    } catch (error) {
      console.error('Error:', error);
    }
  }
};
