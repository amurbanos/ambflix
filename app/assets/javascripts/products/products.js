if(document.getElementById("app_products")){
  var app_users = new Vue({  
    el: '#app_products',
    /*
    *
    */
    data () {
      return {
        products : null
      }
    },
    /*
    *
    */
    mounted () {
      this.getUsers();
    },
    methods: {
    	/*
    	*
    	*/    
    	getUsers: function () {
  	    axios
  	      .get('/admin/products.json')  
  	      .then( response => 
  	        (this.products = response.data.products)
  	      )
      }
    }
  })
}