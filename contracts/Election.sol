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
  //Account storage
  mapping(address =>bool) public voters;
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

  function vote (uint _candidateId) public{
    //Make sure no multiple votes
    require(!voters[msg.sender]);
    //Vote for valid candidate
    require(_candidateId > 0 && _candidateId <= candidatesCount);
    //keep track of voter votes (no multiple)
    voters[msg.sender] = true;
    //update votes (Update with weighted votes based on held tokens)
    candidates[_candidateId].voteCount++;
  }
}
