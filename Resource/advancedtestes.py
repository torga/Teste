from SeleniumLibrary import SeleniumLibrary

class AdvancedTestCase(SeleniumLibrary):

    def open_browser_to_login_page(self):
        self.open_browser("https://seusite.com/login")
        
    def input_credentials(self):
        self.input_text("xpath=//input[@name='username']", "${USERNAME}")
        self.input_text("xpath=//input[@name='password']", "${PASSWORD}")
        self.click_button("xpath=//button[@type='submit']")
    
    def verify_login_successful(self):
        self.wait_until_page_contains("Bem-vindo,")
    
    def go_to_user_profile_page(self):
        self.click_link("xpath=//a[text()='Perfil']")
    
    def create_new_post(self, post_text):
        self.input_text("xpath=//textarea[@name='new_post']", post_text)
        self.click_button("xpath=//button[text()='Postar']")