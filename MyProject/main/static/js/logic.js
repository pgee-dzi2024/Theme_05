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
            file: {},
            new_image: 0,
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
            if (SectionName=='проверка'){
                this.status=4
                this.user.new_image=0
                }
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
                vm.user.new_image=0
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
            this.user.new_image=0
            },
        onImageChange(e){
            this.user.file = e.target.files[0]
            this.user.posts[this.user.active_post].picture = URL.createObjectURL(this.user.file)
            console.log('File ', this.user.file)
            this.user.new_image=1
        },
        addPost(){
            this.user.posts.active_post=this.user.posts.length
            this.user.posts[this.user.active_post]=
                {"id": 0,
                 "post": [],
                 "title": "",
                 "price": "0.00",
                 "description": "",
                 "remark": "",
                 "picture": "",
                 "category": this.categories[0].id,
                 "size": this.sizes[0].id,
                 "user": this.user.id,
                 }
            this.user.new_image=0
        },
        savePostData(){
            function save_picture(obj, post){
                let formData = new FormData();
                formData.append('id', obj.id)
                formData.append('picture', obj.file)
                let url = '/api/save_picture/'
                axios.post(url, formData, {headers: {'X-CSRFToken':CSRF_TOKEN, 'Content-Type': 'multipart/form-data'}})
                obj.user.new_image=0
            }
            function save_post(obj, post){
                const d ={
                        id: post.id,
                        ids: post.id,
                        title: post.title,
                        price: post.price,
                        category: post.category,
                        size: post.size,
                        description: post.description,
                        remark: post.remark,
                        remark: post.remark,
                        user: post.user,
                    }
                console.log('d: ',d)
                axios({
                    method:'POST',
                    url:'/api/save_post/',
                    headers:{
                        'X-CSRFToken':CSRF_TOKEN,
                        'Accept': 'application/json',
                        'Content-Type': 'application/json',
                    },
                    data: d
                })
                .then(response => {
                    console.log('obj.user.new_image: ',obj.user.new_image)
                    if (obj.user.new_image>0){save_picture(obj, post) }
                })
            }
            function create_post(obj, post){
                console.log('new post-->', ' category: ', post.category, ', size: ', post.size, ', user: ', post.user)
                axios({
                    method:'POST',
                    url:'/api/new_post/',
                    headers:{
                        'X-CSRFToken':CSRF_TOKEN,
                        'Accept': 'application/json',
                        'Content-Type': 'application/json',
                    },
                    data:{
                        category: post.category,
                        size: post.size,
                        user: post.user,
                    }
                })
                .then(response => {
                    const id=response.data
                    console.log('new id before =', obj.user.posts[obj.user.active_post].id)
                    obj.user.posts[obj.user.active_post].id = id
                    console.log('new id after =', obj.user.posts[obj.user.active_post].id)
                    post.id = id
                    console.log('new id in post =', post.id)
                    save_post(obj,post)
                })
            }
            let p=this.user.posts[this.user.active_post]
            const vm=this
            if(p.id==0){
                save_post(vm, p)
            }
            else{
                save_post(vm, p)
            }
        },
        category_name(){
            for (i=0; i<this.categories.length; i++){
                if (this.categories[i].id==this.user.posts[this.user.active_post].category){
                    return this.categories[i].name
                }
            }
        },
        size_name(){
            for (i=0; i<this.sizes.length; i++){
                if (this.sizes[i].id==this.user.posts[this.user.active_post].size){
                    return this.sizes[i].value
                }
            }
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
