const App = {
    data() {
     return {
        status: 0, // условeн номер на текущо визуализираната секция (или група секции)
        categories: {},
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

    },
    created: function(){
        this.status = 0
        this.loadCategories()
    }
}

Vue.createApp(App).mount('#main')
