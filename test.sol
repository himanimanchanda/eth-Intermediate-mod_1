// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract InstituteEligibility 
{
    uint256 public score = 30;
    address public administrator;

   
    event ScoreUpdated(uint256 newScore);    

   
    modifier onlyAdmin()                     
    {
        require(msg.sender == administrator, "Access denied: Caller is not the admin");
        _;
    }

    constructor() 
    {
        // Setting the contract deployer as the administrator
        administrator = msg.sender;
    }

    
    function validateIITEligibility(uint256 newScore) external onlyAdmin
    {
        require(newScore > 90, "Ineligible: Score must be greater than 90");

        score = newScore;                                                  
        emit ScoreUpdated(newScore);
    }

    
    function validateNITEligibility(uint256 newScore) external onlyAdmin  
    {
        require(newScore > 80, "Ineligible: Score must be greater than 80");

        score = newScore;
        emit ScoreUpdated(newScore);
    }

    
    function validatePrivateEligibility(uint256 newScore) external onlyAdmin  
    {
        require(newScore > 60, "Ineligible: Score must be greater than 60");

        score = newScore;
        emit ScoreUpdated(newScore);
    }

    
    function checkMinimumPassingScore() external view  
    {
        assert(score >= 33);                          
    }

    
    function validateGeneralEligibility(uint256 newScore) external onlyAdmin 
    {
        if (newScore <= 45) {
            revert("Ineligible: Score must be greater than 45 for any university");
        }
        score = newScore;
        emit ScoreUpdated(newScore);
    }
}
