<template>
    <div class="_1steps_from">
                                <form>
                                    <div class="_login_input_group">
                                        <div class="_login_input">
                                            <i class="fas fa-envelope"></i>

                                            <div class="_login_input_inp">
                                                <input class="_login_input_inp_field" v-model="formdata.title" placeholder="Job title" type="text">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="_login_input_group">
                                        <div class="row">
                                            <div class="col-12 col-md-6">
                                                <div class="_login_input">
                                                    <i class="fas fa-envelope"></i>

                                                    <div class="_login_input_inp">

                                                 <Dropdown trigger="custom" :visible="visible" style="margin-left: 20px margn-right:20px">
                                                    <a href="javascript:void(0)" @click="handleOpen">
                                                        {{catagory}}
                                                        <Icon type="ios-arrow-down"></Icon>
                                                    </a>
                                                    <DropdownMenu slot="list" v-for="(job,i) in alljobs" :key="i">
                                                        <p  @click="handleClose(job.catName)">{{job.catName}}</p>
                                                    </DropdownMenu>
                                                </Dropdown>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="col-12 col-md-6">
                                                <div class="_login_input">
                                                    <i class="fas fa-envelope"></i>

                                                    <div class="_login_input_inp">
                                                        <input class="_login_input_inp_field" v-model="formdata.title" placeholder="Delivery time" type="text">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="_login_input_group">
                                        <p class="_1steps_input_title" >DESCRIPTION</p>

                                        <div class="_login_input">
                                            <div class="_login_input_inp">
                                               <textarea class="_1steps_textarea" rows="4" cols="50" v-model="formdata.title"></textarea>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="_login_input_button">
                                        <button class="_btn _login_input_button_btn _bg" @click="join" type="button">JOIN NOW</button>

                                        <button class="_btn _1steps_DISCARD_btn _bg" type="button">DISCARD</button>
                                    </div>
                                </form>
                            </div>
</template>

<script>
export default {
    data(){
        return{
            formdata:{
                title:'',
                cat_id:'',
                user_id:this.authInfo,
                price:'',
                videoLink:'',
                description:'',
                openingMassage:'',
                daliveryTime:'',
                isFeatured:'',
            },
            items:[],
          itemName:'',
          itemPrice:0,
          ok:0,
          alljobs:'',
          visible: false,
          catagory:'catagory'

        }
    },
    methods:{
        join(){
            this.$store.dispatch('setTabInfo',2);
        },
        
         handleOpen () {
                if(this.visible==false)
                this.visible = true;
                else this.visible = false;
            },
            handleClose (e) {
                this.catagory = e
                this.visible = false;
            },


      async insertAlldata(){

            const res = await this.callApi('get', 'insert-all-services',this.fo)
      }
    },
    async created(){
        const res = await this.callApi('get', 'get-all-catgory')
			this.alljobs = res.data;
    }

}
</script>

<style>

</style>
