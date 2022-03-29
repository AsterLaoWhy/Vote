// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.8.0;
//Things to add:
// 1) Add candidates based on x votes
//    1a) look at how many votes a candidate has
// 2) Vote with percentage of own cryptocurrency
// 3) Link to swap most crypto for voting crypto
//  3a) make voting crypto
contract Election {
  //Variables

  struct Candidate {
  uint id;
  string name;
  uint voteCount;
  }
  //Fetch candidate
  mapping(uint => Candidate) public candidates;
  //candidate count
  uint public candidatesCount;
  constructor () public {
    addCandidate("Candidate 1");
    addCandidate("Candidate 2");
  }
  function addCandidate(string memory _name) private{
    candidatesCount++;
    candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
  }
  /*Ask candidate name (double check name with a=1)Get votes for new candidate, count current candidate votes, if votes>threshold, 
  call add Candidate with name, random id, and vote count of 0*/ 

}
