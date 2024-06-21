# test_web_page_app.py
import unittest
from unittest.mock import patch
import requests  # Add this import
from app import app

class WebPageAppTestCase(unittest.TestCase):
    def setUp(self):
        self.app = app.test_client()
        self.app.testing = True

    @patch('requests.get')
    def test_check_status_success(self, mock_get):
        mock_get.return_value.status_code = 200
        mock_get.return_value.text = "Server is running"
        
        response = self.app.post('/check_status')
        self.assertIn(b'Status Code: 200', response.data)
        self.assertIn(b'Server is running', response.data)

    @patch('requests.get')
    def test_check_status_failure(self, mock_get):
        mock_get.side_effect = requests.exceptions.RequestException("Server is down")
        
        response = self.app.post('/check_status')
        self.assertIn(b'Status Code: Error', response.data)
        self.assertIn(b'Server is down', response.data)

if __name__ == '__main__':
    unittest.main()
