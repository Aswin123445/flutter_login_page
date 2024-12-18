from fastapi import FastAPI
from pydantic import BaseModel
#createing a section
from sqlalchemy.orm import sessionmaker

#importing for sqlalchemy for creating table
from sqlalchemy.ext.declarative import declarative_base

#using sqlalchomg
#connect framework to postgre sql database
from sqlalchemy import TEXT, VARCHAR, Column, LargeBinary, create_engine, true

import uuid as idu
import bcrypt as hash
app=FastAPI()

DATABASE_URL='postgresql://postgres:aswinpassword@localhost:5432/PlayIt'
engine=create_engine(DATABASE_URL)

SessionLocal=sessionmaker(autocommit=False,autoflush=False,bind=engine)

#getting acess to the local base
db=SessionLocal()

class UserCreate(BaseModel):
    name:str
    email:str
    password:str

Base=declarative_base()
class User(Base):
    __tablename__='users'
    id=Column(TEXT,primary_key=true)
    name=Column(VARCHAR(100))
    email=Column(VARCHAR(100))
    password=Column(LargeBinary)

@app.post('/signup')
def Signup_User(user: UserCreate):
    #checking user already existed in the database
    #for that we can use db which has SessionLocal which has 
    #complete information about the local base
    #in that we need to pass the query
    #query method need to give parameter which will take the
    #entitiy which is User
    
    user_db=db.query(User).filter(User.email==user.email).first()
    if user_db:
        return 'User with credentials already exists'
    #adding the user to the database if there is no email present in the
    #record

    #adding new user to the database
    #if the user_db is null then we can use that variable 
    #create an instance of that variable  so
    #id need to be randomly and uniquely generated 
    #for that we can use the module uuid 
    hashed_pw=hash.hashpw(user.password.encode(),hash.gensalt())
    user_db=User(id=str(idu.uuid4()),name=user.name,email=user.email,password=hashed_pw)
    db.add(user_db)
    db.commit()
    db.refresh(user_db)
    return user_db

Base.metadata.create_all(engine)