import os

from flask import Flask, session, jsonify, request, render_template, redirect
import pymysql

app = Flask(__name__)

app.secret_key = os.urandom(24)


def db():
    return pymysql.connect(host='47.95.4.219', user='bbs', password='bbs131', port=3306, charset='utf8mb4', db='bbs')


@app.route('/')
def mb():
    """
    Template control
    :return:
    """
    ac = request.args.get('ac')
    if ac == 'index':
        # Jump page
        if not session.get('user'):
            return redirect('/')
        return render_template('index.html', **{'user': session.get('user')})
    elif ac == 'reg':
        # register
        return render_template('reg.html')
    elif ac == 'push':
        # Release theme
        if not session.get('user'):
            return redirect('/')
        return render_template('push.html')
    elif ac == 'can':
        # viewDetailed
        if not session.get('user'):
            return redirect('/')
        pid = request.args.get('id')
        con = db()
        cu = con.cursor(pymysql.cursors.DictCursor)
        cu.execute("select * from subject where id=%s", (pid,))
        data = cu.fetchall()[0]
        cu.execute("select * from revet where sub_id=%s group by id DESC", (pid,))
        revet = cu.fetchall()
        con.close()
        data['revet'] = revet
        return render_template('can.html', **{'data': data})
    # Return to the login page
    session.clear()
    return render_template('login.html')


@app.route('/reg', methods=('POST',))
def reg():
    """
    register
    :return:
    """
    user = request.form.get('user')
    password = request.form.get('password')
    if not all([user, password]):
        return jsonify({'code': 0, 'message': 'Please enter user/password'})
    con = db()
    cu = con.cursor(pymysql.cursors.DictCursor)
    cu.execute("select id from users where user=%s", (user,))
    if cu.fetchall():
        return jsonify({'code': 0, 'message': 'The user already exists'})
    cu.execute("insert into users (user, password) value(%s, %s)", (user, password))
    con.commit()
    con.close()
    return jsonify({'code': 1, 'message': 'registered successfully '})


@app.route('/login', methods=('POST',))
def login():
    """
    log in
    :return:
    """
    user = request.form.get('user')
    password = request.form.get('password')
    if not all([user, password]):
        return jsonify({'code': 0, 'message': 'Please enter user/password'})
    con = db()
    cu = con.cursor(pymysql.cursors.DictCursor)
    cu.execute("select id from users where user=%s and password=%s", (user, password))
    if cu.fetchall():
        session['user'] = user
        return jsonify({'code': 1, 'message': 'login successfully'})
    return jsonify({'code': 0, 'message': 'login failure'})


@app.route('/getlist', methods=('GET',))
def getlist():
    """
    Get a list of topics
    :return:
    """
    title = request.args.get('title')
    con = db()
    cu = con.cursor(pymysql.cursors.DictCursor)
    sql = "select * from subject where 1=1 "
    if title:
        sql += f' and title like "%{title}%"'
    cu.execute(sql)
    data = cu.fetchall()
    return jsonify({'code': 1, 'message': 'succeed', 'data': data})


@app.route('/push', methods=('POST',))
def push():
    """
    Release theme
    :return:
    """
    title = request.form.get('title')
    text = request.form.get('text')
    user = session.get('user')
    if not all([title, text, user]):
        return jsonify({'code': 0, 'message': 'Please complete before Posting'})
    con = db()
    cu = con.cursor(pymysql.cursors.DictCursor)
    cu.execute("insert into subject(title,text,user) value(%s,%s,%s)", (title, text, user))
    con.commit()
    con.close()
    return jsonify({'code': 1, 'message': 'Release success'})


@app.route('/revet', methods=('POST',))
def revet():
    """
    reply
    :return:
    """
    revet = request.form.get('revet')
    sub_id = request.form.get('sub_id')
    user = session.get('user')
    con = db()
    cu = con.cursor()
    cu.execute("insert into revet(sub_id, revet, user) value (%s, %s, %s)", (sub_id, revet, user))
    con.commit()
    con.close()
    return jsonify({'code': 1, 'message': 'Reply to success'})


@app.route('/deleted', methods=('POST',))
def deleted():
    """
    deleted
    :return:
    """
    pid = request.form.get('pid')
    con = db()
    cu = con.cursor()
    cu.execute("delete from subject where id=%s", (pid, ))
    con.commit()
    con.close()
    return jsonify({'code': 1, 'message': 'delete to success'})


if __name__ == '__main__':
    app.run(debug=True)
