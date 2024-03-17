const App = {
    data() {
     return {
        status: 0, // условeн номер на текущо визуализираната секция (или група секции)
        categories: [],
        sizes: [],
        posts: [],
        category: 0, // номер на категория по която се филтрира (0 - всички)
        max_posts:2,
        max_posts_mode:1,
        current_post:{},
        user: {
            name: '',
            password: '',
            id: 0,
            active_post: 0,
            posts: [],
            },
        new_user: {
            name: '',
            email: '',
            user: '',
            password1: '',
            password2: '',
            },
        new_comment: {
            post_id: 0,
            name: '',
            mail: '',
            phone: '',
            message: '',
        }
        }
     },

    methods: {
        setSection(SectionName){
            if (SectionName=='начало')
                {this.status=0}
            if (SectionName=='вход')
                {this.status=1}
            if (SectionName=='регистриране')
                {this.status=2}
            if (SectionName=='обява'){
                this.status=3
                this.new_comment.post_id = this.current_post.id
                this.new_comment.name = ''
                this.new_comment.mail = ''
                this.new_comment.phone = ''
                this.new_comment.message = ''
                }
            if (SectionName=='проверка')
                {this.status=4}
        },
        loadCategories(){
            vm = this
            axios.get('/api/categories/')
            .then(function(response){
                vm.categories = response.data;
                })
        },
        loadSizes(){
            vm = this
            axios.get('/api/sizes/')
            .then(function(response){
                vm.sizes = response.data;
                })
        },
        loadPosts(){
            vm = this
            axios.get('/api/posts/'+this.category+'/')
            .then(function(response){
                vm.posts = response.data;
                })
        },
        deletePost(){
            vm = this
            idx = this.user.active_post
            idn = this.user.posts[idx].id
            console.log('/api/delete/'+idn+'/')
            axios({
                method:'POST',
                url:'/api/delete/',
                headers:{
                    'X-CSRFToken':CSRF_TOKEN,
                    'Accept': 'application/json',
                    'Content-Type': 'application/json',
                },
                data:{
                    id: idn,
                }
            })
            .then(function(response){
                console.log('status', response.status)
                if (response.status==201){
                    console.log('Обявата е премахната')
                    vm.loadUserPosts()
                    }
                else{
                    console.log('Грешка изтриване на обява')
                    }
                })
        },
        loadUserPosts(){
            vm = this
            ax = '/api/check/'+this.user.id+'/'
            axios.get(ax)
            .then(function(response){
                vm.user.posts = response.data;
                })
        },
        set_filter(cat){
            this.category = cat
            this.loadPosts()
            if(this.status>0){this.setSection('начало')}
        },
        set_max_mode(){
            if (this.max_posts_mode==0)
                {this.max_posts_mode=1}
            else
                {this.max_posts_mode=0}
            console.log("max_posts_mode=",this.max_posts_mode)
        },
        show_post_details(num){
            this.current_post = this.posts[num]
            this.setSection('обява')
        },
        login(){
            axios({
                method:'POST',
                url:'/api/login/',
                headers:{
                    'X-CSRFToken':CSRF_TOKEN,
                    //'Access-Control-Allow-Origin':'*',
                    'Accept': 'application/json',
                    'Content-Type': 'application/json',
                },
                data:{
                    user: this.user.name,
                    password:  this.user.password,
                }
            })
            .then(response => {
                if (response.data.length>0) {
                    this.user.id=response.data[0].id
                    this.setSection('начало')
                    this.loadUserPosts()
                    console.log('login OK')
                    }
                else {
                    this.user.id=0
                    }
            })
            .catch(error => {
                throw("Error: ",error);
            })
        },
        logout(){
            this.user.id=0
            this.setSection('начало')
        },
        addNewUser(){
            console.log('new user: ', this.new_user)
            axios({
                method:'POST',
                url:'/api/register/',
                headers:{
                    'X-CSRFToken': CSRF_TOKEN,
                    'Accept': 'application/json',
                    'Content-Type': 'application/json',
                },
                data:{
                    name: this.new_user.name,
                    email: this.new_user.email,
                    user: this.new_user.user,
                    password: this.new_user.password1,
                }
            })
            .then(response => {
                console.log('status', response.status)
                if (response.status==201) {
                    this.user.name=this.new_user.user
                    this.user.password=this.new_user.password1
                    this.login()
                    }
                else {
                    this.user.id=0
                    }
            })
            .catch(error => {
                throw("Error: ",error);
            })
        },
        addComment(){
            console.log('new comment: ', this.new_comment)
            axios({
                method:'POST',
                url:'/api/comment/',
                headers:{
                    'X-CSRFToken': CSRF_TOKEN,
                    'Accept': 'application/json',
                    'Content-Type': 'application/json',
                },
                data:{
                    post_id: this.new_comment.post_id,
                    name: this.new_comment.name,
                    mail: this.new_comment.mail,
                    phone: this.new_comment.phone,
                    message: this.new_comment.message,
                }
            })
            .then(function(response){
                console.log('status', response.status)
                if (response.status==201){
                    console.log('Отзивът е записан')
                    }
                else{
                    console.log('Грешка при запис на отзив')
                    }
            })
       },
        changeActivePost(direction){
            this.user.active_post += direction
            if(this.user.active_post<0){this.user.active_post=0}
            if(this.user.active_post>=this.user.posts.length){this.user.active_post=this.user.posts.length-1}
            },
        },
    created: function(){
        this.status = 0
        this.loadCategories()
        this.loadSizes()
        this.loadPosts()
    }
}

Vue.createApp(App).mount('#main')
