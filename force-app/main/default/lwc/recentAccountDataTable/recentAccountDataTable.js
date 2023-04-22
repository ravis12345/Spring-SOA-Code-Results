import { LightningElement ,track} from 'lwc';
import fetchAccountData from '@salesforce/apex/AccountsController.fetchAccountData';
const columns=[
    { 
        label: 'Account Id',
        fieldName: 'accountLink',
        type:'url',
        typeAttributes: {
            label: { 
                fieldName: 'accountName'
            },
            target : '_blank'
        }
    },
    { 
        label: 'Account Id',
        fieldName: 'accountName',
        type:'Text',
    },
    {
        label: 'Account Number',
        fieldName: 'AccountNumber',
        type:'Text',
    },
    {
        label: 'Account Source',
        fieldName: 'AccountSource',
        type:'Text',
    },
    {
        label: 'Type',
        fieldName: 'Type',
        type:'Text',
    },
    {
        label: 'Total Contact',
        fieldName: 'TotalContact',
        type:'Text',
    }
]
console.log('columns:::: '+columns[0])

export default class RecentAccountDataTable extends LightningElement {

    @track columns=columns;
    @track data=[];
    @track error;
    connectedCallback(){
      fetchAccountData()
      .then(result=>{
          this.data=result;
      })
      .catch(error=>{
          console.log('There is the error while calling apex class')
      })
    }
}