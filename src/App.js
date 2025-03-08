import React from "react";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import RedirectPage from "./RedirectPage";
import PatientPage from "./PatientPage";
import DoctorPage from "./DoctorPage";

const App = () => {
  return (
    <Router>
      <Routes>
        <Route path="/" element={<RedirectPage />} />
        <Route path="/patient" element={<PatientPage />} />
        <Route path="/doctor" element={<DoctorPage />} />
      </Routes>
    </Router>
  );
};

export default App;

