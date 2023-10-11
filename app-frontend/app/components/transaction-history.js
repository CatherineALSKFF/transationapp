
//  app/components/transaction-history.js
import { inject as service } from '@ember/service';
import Component from '@ember/component';
import { tracked } from '@glimmer/tracking';
import { action } from '@ember/object';
export default class TransactionHistoryComponent extends Component {
  @service apiService;
  // Hardcoded array
  @tracked
  transactions = [
    { name: 'Item1', value: 100 },
    { name: 'Item2', value: 200 },
    { name: 'Item3', value: 300 },
  ];
  async didInsertElement() {
    super.didInsertElement(...arguments);
    this.transactions = await this.apiService.get('http://127.0.0.1:3000/api/v1/transactions');
    console.log(this.transactions);
    // Pass the transactions variable to the component as an argument
    // this.args.transactions = this.transactions;
  }
  Actions
  @action
  async handleSubmit(event) {
    event.preventDefault();
    const accountId = this.element.querySelector('#account-id').value;
    const amount = this.element.querySelector('#amount').value;
    const body = {
      account_id: accountId,
      amount: amount,
    };
    await this.apiService.post('http://127.0.0.1:3000/api/v1/transactions', body);
    this.transactions = await this.apiService.get('http://127.0.0.1:3000/api/v1/transactions');
    this.element.querySelector('#account-id').value = '';
    this.element.querySelector('#amount').value = '';
  }
}