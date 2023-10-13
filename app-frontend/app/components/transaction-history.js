//  app/components/transaction-history.js
import { inject as service } from '@ember/service';
import Component from '@ember/component';
import { tracked } from '@glimmer/tracking';

export default class TransactionHistoryComponent extends Component {
  @service apiService;
  // Hardcoded array
  @tracked
  transactions = [
    // { accountId: 200, currentBalance: 12 },
    // { accountId: 12, currentBalance: 50 },
    { name: 'Item1', value: 100 },
    { name: 'Item2', value: 200 },
    { name: 'Item3', value: 300 },
  ];
  async didInsertElement() {
    super.didInsertElement(...arguments);
    this.transactions = await this.apiService.get(
      'http://127.0.0.1:3000/api/v1/transactions'
    );
    console.log(this.transactions);
    // Reverse the order of the transactions array
    this.transactions = this.transactions.reverse();
  }
}
