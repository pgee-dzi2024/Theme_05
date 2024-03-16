const App = {
    data() {
     return {
        status: 0, // условeн номер на текущо визуализираната секция (или група секции)
        categories: [],
        posts: [],
        category: 0, // номер на категория по която се филтрира (0 - всички)
        max_posts:2,
        max_posts_mode:1,
        current_post:{},
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
            if (SectionName=='обява')
                {this.status=3}
            if (SectionName=='проверка')
                {this.status=4}
        },
        loadCategories(){
            vm = this
            axios.get('/api/categories/')
            .then(function(response){
            console.log(response)
            console.log(response.data)
                vm.categories = response.data;
                })
        },
        loadPosts(){
            vm = this
            console.log('/api/posts/'+this.category+'/')
            axios.get('/api/posts/'+this.category+'/')
            .then(function(response){
            console.log(response.data)
                vm.posts = response.data;
                })
        },
        set_filter(cat){
            this.category = cat
            this.loadPosts()
            console.log("max_posts_mode=",this.max_posts_mode)
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

    },
    created: function(){
        this.status = 0
        this.loadCategories()
        this.loadPosts()
    }
}

Vue.createApp(App).mount('#main')
