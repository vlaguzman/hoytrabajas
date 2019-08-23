RSpec.feature "sing up user", :type => :feature do                                                                                           
  scenario "Like a external user, I should get in hoytrabajas.com and see the option 'registarse'" do                                        
    expect(page).to have_text("registrarse")                                                                                                 
    click_button 'registrarse'                                                                                                               
    scenario "I want to sing up with email and password" do                                                                                  
      scenario "I am looking for a job" do                                                                                                  
        fill_in "email", :with => "candidate@gmail.com"                                                                                     
        fill_in "password", :with => "iwanttofindajob"                                                                                       
        page.select 'Candidato', from: 'user_role'                                                                                           
        click_button 'crear cuenta'                                                                                                          
        expect(page).to have_text("El trabajo ideal si existe!")                                                                             
      end                                                                                                                                    
      scenario "I am looking for a candidate" do                                                                                             
        fill_in "email", :with => "employee@gmail.com"                                                                                       
        fill_in "password", :with => "iwanttofindaemployee"                                                                                  
        page.select 'Empleador', from: 'user_role'                                                                                           
        click_button 'crear cuenta'                                                                                                          
        expect(page).to have_text("El empleado ideal si existe!")                                                                            
      end                                                                                                                                    
    end                                                                                                                                      
    scenario "I want to sing up with Facebook" do                                                                                            
      expect(page).to have_text("regístrate con")                                                                                            
      page.should have_selector(:link_or_button, 'Facebook')                                                                                 
      expect(page).to have_text("Escoge tu tipo de cuenta")                                                                                  
    end                                                                                                                                      
    scenario "I want to sing up with Google" do                                                                                              
      expect(page).to have_text("regístrate con")                                                                                            
      page.should have_selector(:link_or_button, 'Google')                                                                                   
      expect(page).to have_text("Escoge tu tipo de cuenta")                                                                                  
    end                                                                                                                                      
  end                                                                                                                                        
end
