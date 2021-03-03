
if(document.getElementById("app_users")){
  var app_users = new Vue({  
    el: '#app_users',
    /*
    *
    */
    data () {
      return {
        users : null
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
      deleteUser: function (id) {
      	if (confirm("Tem certeza")) {
  		    axios.delete('/admin/users.json?id=' + id)
  		      .then(response => {
  		        this.getUsers()
  		      });
      	}
      },
    	/*
    	*
    	*/    
    	getUsers: function () {
  	    axios
  	      .get('/admin/users.json')  
  	      .then( response => 
  	        (this.users = response.data.users)
  	      )
      }
    }
  })
}