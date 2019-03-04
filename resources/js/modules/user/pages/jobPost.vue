<template>
       <div>

 <div class="_job_step">
            <div class="container-fluid">
                <div class="row justify-content-center">
                    <div class="col-12 col-md-6">
                        <div class="_job_step_main">
                            <div class="_job_step_title">
                                <h3 class="_title">POST A JOB</h3>
                            </div>

                                <!--~~~~~~~ Steps ~~~~~~~~-->
                            <div class="_1steps_all">
                                <div class="_1steps">
                                    <div class="_1steps_one _1steps_one_done _1steps_main _1steps_on">
                                        <p class="_1steps_no">1</p>
                                        <i class="fas fa-check"></i>
                                    </div>
                                    <div class="_1steps_two _1steps_main _1steps_on">
                                        <p class="_1steps_no">2</p>
                                    </div>
                                    <div class="_1steps_three _1steps_main">
                                        <p class="_1steps_no">3</p>
                                    </div>
                                </div>
                            </div>
                                <!--~~~~~~~ Steps ~~~~~~~~-->

                                <!--~~~~~~~ From ~~~~~~~~~-->
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

                                    <div class="_login_input_group">
                                        <div class="_1steps_img _1steps_shadow">
                                            <img class="_1steps_img_pic" src="img/V90.jpg"  title="">
                                        </div>

                                        <div class="_1steps_img_select">
                                            <ul class="_1steps_img_select_pic">
                                                <li class="_1steps_shadow">
                                                    <img src="img/V90.jpg"  title="">

                                                    <p class="_1steps_cencel _1steps_shadow">
                                                       <i class="fas fa-plus"></i>
                                                    </p>
                                                </li>

                                                 <li class="_1steps_shadow _1steps_img_select_active">
                                                    <img src="img/V90.jpg"  title="">

                                                    <p class="_1steps_cencel _1steps_shadow">
                                                       <i class="fas fa-plus"></i>
                                                    </p>
                                                </li>

                                                 <li class="_1steps_shadow">
                                                    <img src="img/V90.jpg"  title="">

                                                    <p class="_1steps_cencel _1steps_shadow">
                                                       <i class="fas fa-plus"></i>
                                                    </p>
                                                </li>

                                                <li class="_1steps_add">
                                                    <i class="fas fa-plus"></i>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>    

                                    <div class="_login_input_group">
                                        <p class="_1steps_input_title" >EXTRA</p>

                                        <div class="_login_input" v-for="(item,i) in items" :key="i" >
                                            <div class="_login_input_inp" >
                    
                                                <input class="_login_input_inp_field" v-model="item.name" placeholder="Extra" type="text">
                                                <input class="_login_input_inp_field" v-model="item.price" placeholder="price" type="text">
                                                 <a id="thisok" class="remove-items mjob-remove-extra-item"><i class="fa fa-times"></i></a>

                                            </div>
                                        </div>
                                        <div v-if="ok">
                                        <input class="_login_input_inp_field" v-model="itemName" placeholder="Extra" type="text">
                                        <input class="_login_input_inp_field" v-model="itemPrice" placeholder="price" type="text"> 
                                        
                                                 <a id="thisok" class="remove-items mjob-remove-extra-item"><i class="fa fa-times"></i></a>
                                          
                                      
                                        </div>
                                        <Button @click="add">add</Button>
                                       
                                    
                                    </div>

                                    <div class="_login_input_group">
                                        <p class="_1steps_input_title">TAGS</p>

                                        <div class="_login_input">
                                            <div class="_login_input_inp">
                                                <input class="_login_input_inp_field" v-model="formdata.title" placeholder="Extra" type="text">
                                            </div>
                                        </div>
                                    </div>

                                    <div class="_login_input_button">
                                        <button class="_btn _login_input_button_btn _bg" type="button">JOIN NOW</button>

                                        <button class="_btn _1steps_DISCARD_btn _bg" type="button">DISCARD</button>
                                    </div>
                                </form>
                            </div>
                                <!--~~~~~~~ From ~~~~~~~~~-->
                        </div>
                    </div>
                </div>
            </div>
        </div>


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
   async created(){
         const res = await this.callApi('get', 'get-all-catgory')
			this.alljobs = res.data;
    },
    methods:{
        add(){
            //data.push({"name": "Tony Montana", "age": "99"});
            if(this.ok>0){
                this.items.push({name:this.itemName,price:this.itemPrice})
                    this.ok=1
                    this.itemName=''
                    this.itemPrice=0
            }
            else{
                    this.ok=1
          
            }
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
    }
}
</script>

