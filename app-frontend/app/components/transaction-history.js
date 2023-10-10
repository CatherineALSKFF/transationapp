// app/components/transaction-history.js
import { inject as service } from '@ember/service';
import  Component  from '@ember/component';


export default Component.extend({
  apiService: service(),
  
  async didInsertElement() {
    this._super(...arguments);

    this.transactions = await this.apiService.get('http://127.0.0.1:3000/api/v1/transactions');
    console.log(this.transactions);
  },

  actions: {
    async handleSubmit(event) {
      event.preventDefault();

      // Get the account ID and amount from the form fields
      const accountId = this.element.querySelector('#account-id').value;
      const amount = this.element.querySelector('#amount').value;

      // Create a body object with the account ID and amount
      const body = {
        account_id: accountId,
        amount: amount
      };

      // Make a POST request to the API to create a new transaction
      await this.apiService.post('http://127.0.0.1:3000/api/v1/transactions', body);

      // Clear the form
      this.element.querySelector('#account-id').value = '';
      this.element.querySelector('#amount').value = '';
    }
  }
  

});



















// // app/components/form.js
// import Component from '@ember/component';
// import { service } from '@ember/service';

// export default Component.extend({
//   apiService: service(),

//   transaction: {
//     accountId: null,
//     amount: null,
//   },

//   actions: {
//     async submit() {
//       const transaction = {
//         accountId: this.transaction.accountId,
//         amount: this.transaction.amount,
//       };

//       await this.apiService.post('http://localhost:3000/api/v1/transactions', transaction);

//       // Clear the form
//       this.transaction = {
//         accountId: null,
//         amount: null,
//       };
//     }
//   }
// });













