import React from "react";
import { useNavigate } from "react-router-dom";

const RedirectPage = () => {
  const navigate = useNavigate();

  return (
    <div style={{ textAlign: "center", marginTop: "50px" }}>
      <h2>Select Your Role</h2>
      <button onClick={() => navigate("/doctor")} style={buttonStyle}>
        I'm a Doctor
      </button>
      <button onClick={() => navigate("/patient")} style={buttonStyle}>
        I'm a Patient
      </button>
    </div>
  );
};

// Simple button styling
const buttonStyle = {
  padding: "10px 20px",
  margin: "10px",
  fontSize: "16px",
  cursor: "pointer",
  borderRadius: "5px",
  border: "none",
  backgroundColor: "#007BFF",
  color: "white",
};

export default RedirectPage;

